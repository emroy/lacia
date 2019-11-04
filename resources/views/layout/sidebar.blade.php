<section>
    <!-- Left Sidebar -->
    <section class="hide">
    <form id="logoutform" action="/logout" method="POST">
        {{ csrf_field() }}
    </form>
    </section>
    <aside id="leftsidebar" class="sidebar">
        
        <!-- User Info -->
        <div class="user-info">
            <div class="image">
            </div>
            <div class="info-container">
                <div class="name" style="text-transform:uppercase" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>{{ Auth::user()->username }}</b></div>
                <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>{{ Auth::user()->apelnomb }}</b></div>
                <div class="email"><b>{{ Auth::user()->correo }}</b></div>
                <div class="btn-group user-helper-dropdown">
                    <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="{{ route('user_profile') }}"><i class="material-icons">person</i>Profile</a></li>
                        <li role="seperator" class="divider"></li>
                        <li><a onclick="document.getElementById('logoutform').submit()"><i class="material-icons">input</i>Sign Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- #User Info -->
        
        <!-- Menu -->
        <div class="menu">
            <ul class="list">
                <li class="header">NAVEGACIÓN PRINCIPAL</li>
                <li class="active">
                    <a href="{{ route('home') }}">
                        <i class="material-icons">home</i>
                        <span>Página Principal</span>
                    </a>
                </li>
                @if(Auth::user()->perfil() != 4)
                <li>
                    <a href="{{ route('admin') }}" class="menu-toggle">
                        <i class="material-icons">android</i>
                        <span>Admin Panel</sp
                        an>
                    </a>
                </li>
                <li>
                    <a href="#" class="menu-toggle">
                        <i class="material-icons">sync</i>
                        <span>Inversores</span>
                    </a>
                    <ul class="ml-menu">
                        <li>
                            <a href="{{ route('new_investor') }}">Nuevo Inversor</a>
                        </li>
                    </ul>
                </li>
                {{--<li>
                    <a href="#" class="menu-toggle">
                        <i class="material-icons">build</i>
                        <span>Workers</span>
                    </a>
                    <ul class="ml-menu">
                        <li>
                            <a href="{{ route('new_worker') }}">Nuevo Worker</a>
                        </li>
                        <li>
                            <a href="{{ route('workers') }}">Workers Registrados</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="menu-toggle">
                        <i class="material-icons">map</i>
                        <span>Locaciones</span>
                    </a>
                    <ul class="ml-menu">
                        <li>
                            <a href="{{ route('new_location') }}">Nueva Locación</a>
                        </li>
                    </ul>
                </li>--}}
                @endif
                
            </ul>
        </div>
        <!-- #Menu -->
        
        <!-- Footer -->
        <div class="legal">
            <div class="copyright">
                <b>&copy; 2018 </b><a href="#">Edited with <i class="material-icons" style="font-size:15px;color:red">favorite</i> by <b>Emroy</b></a>.
            </div>
        </div>
        <!-- #Footer -->

    </aside>
    <!-- #END# Left Sidebar -->
    <!-- Right Sidebar
    <aside id="rightsidebar" class="right-sidebar">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active in active" id="settings">
                <div class="demo-settings">
                    <p>GENERAL SETTINGS</p>
                    <ul class="setting-list">
                        <li>
                            <span>Report Panel Usage</span>
                            <div class="switch">
                                <label><input type="checkbox" checked><span class="lever"></span></label>
                            </div>
                        </li>
                        <li>
                            <span>Email Redirect</span>
                            <div class="switch">
                                <label><input type="checkbox"><span class="lever"></span></label>
                            </div>
                        </li>
                    </ul>
                    <p>SYSTEM SETTINGS</p>
                    <ul class="setting-list">
                        <li>
                            <span>Notifications</span>
                            <div class="switch">
                                <label><input type="checkbox" checked><span class="lever"></span></label>
                            </div>
                        </li>
                        <li>
                            <span>Auto Updates</span>
                            <div class="switch">
                                <label><input type="checkbox" checked><span class="lever"></span></label>
                            </div>
                        </li>
                    </ul>
                    <p>ACCOUNT SETTINGS</p>
                    <ul class="setting-list">
                        <li>
                            <span>Offline</span>
                            <div class="switch">
                                <label><input type="checkbox"><span class="lever"></span></label>
                            </div>
                        </li>
                        <li>
                            <span>Location Permission</span>
                            <div class="switch">
                                <label><input type="checkbox" checked><span class="lever"></span></label>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </aside>
    <!-- #END# Right Sidebar -->
</section>