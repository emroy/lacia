const fs = require('fs');

module.exports = {

    /**
     * Method used to save new data in existing files
     * @param type 
     * @param data
     * @return boolean|exception
     */
    saveData: (type, data) => {
        try {
            var file = JSON.parse(this.loadFile(type));
            file.push(data);
            const updated = JSON.stringify(data);
            if(this.saveFile(type, updated)) return;
        } catch(e) {
            return console.log(e);
        }
    },

    /**
     * Method used just to verify existing file and save
     * @param type 
     * @param updatedData
     * @return boolean|exception
     */
    saveFile: (type, updatedData) => {
        fs.writeFile(`${type}.json`, updatedData, function (err) {
            if(err) throw `Error al actualizar archivo ${type}.json`;
        });
        return true;
    },
    
    /**
     * Method used to load existing file
     * @param type
     * @return String
     */
    loadFile: (type) => {
        var data = "";
        fs.readFile(`${type}.json`, function(err, stream) {
            if(err) throw `Error al cargar archivo ${type}.json`;
            data = stream;
        });
        return data;
    }

}