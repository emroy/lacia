<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Exceptions\ReportLoaderException;
use App\Traits\ApiReportTools;
use App\Traits\SaverTools;
use App\Worker;

class ApiController extends Controller
{
    use ApiReportTools, SaverTools;

    const WORKER = 2;

    /**
     * Este es el controlador que se encarga de hacerle parsing al documento enviado
     * por el robot.
     * @param Request $request JsonFile
     * @return Response $jsonResponse
     */
    public function readReport(Request $request){
        try {
            
            DB::beginTransaction();

            $this->hasRightFormat($request);

            $this->mainProcess();

            $this->triggerBroadcastEvent();

            DB::commit();
            
            return response()->json(['success' => 'Se ha agregado el reporte exitosamente']);

        } catch( ReportLoaderException $e ) {
            
            DB::rollBack();

            error_log('=========== ReportLoaderException =============');
            error_log($e->getMessage());

            return response()->json([
                'error' => $e->getMessage()
            ]);

        }
    }

}