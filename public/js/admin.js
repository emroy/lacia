
var app = angular.module('mineriaApp', []);

app.controller('main', ($scope, $http, $q, $rootScope) => {

    /**
     * Definir las criptomonedas basicas 
     */
    $scope.currencies = {
        bitcoin:0
    };

    $scope.first = true;

    $scope.$on('user-data', (_, data) => {
        $scope.user = data.user;
        $scope.info = data.info;
        $scope.loadMovements();
    });

    $scope.$on('crypto-update', (_, data) => {
        $scope.currencies.bitcoin = parseFloat(data.bitcoin);
        if($scope.first){
            $scope.loadTable()
            $scope.first = !$scope.first
        }
    });

    $scope.loadMovements = () => {
        $("#mov").DataTable({
            ajax: {
                'url':'/resource/movimientos',
                'type':'post',
                'dataSrc':'data'
            }
        });
    }

    $scope.loadTable = () => {

        $("#spec").DataTable({
            ajax: {
                'url':'/transaction/data',
                'type':'post',
                'dataSrc':'data'
            },
            columns: [
                {
                    'data':'fecha',
                    'render': data => {
                        var date = new Date(data);
                        return date.getDate()+'-'+date.getMonth()+'-'+date.getFullYear();
                    }
                },
                {
                    'data':'id_tipo_transaccion',
                    'render': data => {
                        if(data == 2){
                            return '<span style="background-color:green" class="badge success">DEPOSITO</span>'
                        } else {
                            return '<span style="background-color:red" class="badge danger">RETIRO</span>'
                        }
                    }
                },
                {
                    'data':'cantidad',
                    'render': data => {
                        return '<b>'+data+'</b>'
                    }
                },
                {
                    'data':'rate',
                    'render': data => {
                        return '<b>'+data+'</b>'
                    }
                },
                {
                    'data':'costo_promedio',
                    'render': data => {
                        return '<b>'+data+'</b>'
                    }
                },
                {
                    'data':null,
                    'render': data => {
                        if(data.id_tipo_transaccion == 2){
                            var past_rate = parseFloat(data.rate);
                            var current_rate = parseFloat($scope.currencies.bitcoin);
                            var dif = Math.abs(past_rate - current_rate);
                            porcentaje = (dif * 100) / past_rate;
                            type = (past_rate <= current_rate);
                            if(!type){
                                return '<b style="color:red">-</b><span ng-data-rate="'+past_rate+'" ng-data-type="toPercent" ng-recalculate class="percent negativo">'+porcentaje.toFixed(2)+'%'+'</span>';
                            } else {
                                return '<b style="color:green">+</b><span ng-data-rate="'+past_rate+'" ng-data-type="toPercent" ng-recalculate class="percent positivo">'+porcentaje.toFixed(2)+'%'+'</span>';
                            }
                        } else {
                            var past_rate = parseFloat(data.rate);
                            var current_rate = parseFloat($scope.currencies.bitcoin);
                            var dif = Math.abs(past_rate - current_rate);
                            porcentaje = (dif * 100) / past_rate;
                            type = (past_rate <= current_rate);
                            if(!type){
                                return '<span class="percent negativo">-'+porcentaje.toFixed(2)+'%'+' </span>';
                            } else {
                                return '<span class="percent positivo">+'+porcentaje.toFixed(2)+'%'+' </span>';
                            }
                        }
                        
                    }
                },
                {
                    'data':null,
                    'render': data => {
                        if(data.id_tipo_transaccion == 2){
                            let past_cost  = parseFloat(data.cantidad * data.rate);
                            let new_cost = parseFloat(data.cantidad * $scope.currencies.bitcoin);
                            var dif = Math.abs(past_cost - new_cost);
                            type = (past_cost <= new_cost);
                            if(!type){
                                return '<b style="color:red">-</b><span ng-recalculate ng-data-type="toUSD" ng-data-quantity="'+data.cantidad+'" ng-data-cost="'+past_cost+'" class="percent negativo">'+dif.toFixed(2)+'</span>';
                            } else {
                                return '<b style="color:green">+</b><span ng-recalculate ng-data-type="toUSD" ng-data-quantity="'+data.cantidad+'" ng-data-cost="'+past_cost+'" class="percent positivo">'+dif.toFixed(2)+'</span>';
                            }
                        } else {
                            let past_cost = parseFloat(data.cantidad * data.rate);
                            let new_cost = parseFloat(data.cantidad * $scope.currencies.bitcoin);
                            var dif = Math.abs(past_cost - new_cost);
                            type = (past_cost <= new_cost);
                            if(!type){
                                return '<b style="color:red">-</b><span class="percent negativo">'+dif.toFixed(2)+'</span>';
                            } else {
                                return '<b style="color:green">+</b><span class="percent positivo">'+dif.toFixed(2)+'</span>';
                            }
                            
                        }
                        
                    }
                },
                {
                    'data':null,
                    'render': (data) => {
                        return '<button class="btn btn-primary" onclick="archive(this,'+data.id+')">Archivar</button>';
                    }
                },
            ]
        });

    }

    

});

app.controller('app',($scope, $http, $rootScope) => {

    $scope.currencies = {bitcoin:0};
    $scope.user = {fondos:0, raw:0, holdings:[]};
    $scope.time = true;
    $scope.WS = {}

    $scope.WS.bitcoin = new WebSocket('wss://ws.coincap.io/prices?assets=bitcoin')

    $scope.WS.bitcoin.onmessage = function(msg){
        oldData = $scope.currencies;
        newData = JSON.parse(msg.data);
        if(!oldData.bitcoin || $scope.IsValid(oldData.bitcoin, newData.bitcoin)){
            $rootScope.$broadcast('crypto-update',  newData);
            $scope.currencies.bitcoin = newData.bitcoin;
            $scope.recalculate(newData.bitcoin);

        } else {
            $rootScope.$broadcast('crypto-update-main', newData);
            if(!$('[ng-model="transaction.rate"]').hasClass('unactive')){
                $rootScope.$broadcast('update-modal', newData);
            }
        }
        if($scope.first){
            $scope.first = !$scope.first
            $scope.loadTable();
        }
    }

    $scope.IsValid = (newd, oldd) => {
        var por = (Math.abs(newd - oldd) * 100) / oldd;
        return (por >= 0.01);
    }

    $scope.recalculate = new_rate => {
        elements = $('[ng-recalculate]')
        elements.each(function(item){
            if($(this).attr('ng-data-type') == 'toUSD'){
                var past_cost = parseFloat($(this).attr('ng-data-cost')).toFixed(2);
                var new_cost = parseFloat($(this).attr('ng-data-quantity')).toFixed(2) * new_rate;
                var dif = Math.abs(past_cost - new_cost);
                $(this).html(dif.toFixed(2));
            } else if($(this).attr('ng-data-type') == 'toPercent') {
                var dif = Math.abs(parseFloat($(this).attr('ng-data-rate')).toFixed(2) - new_rate);
                porcentaje = (dif * 100) / $(this).attr('ng-data-rate');
                $(this).html(porcentaje.toFixed(2)+'%')
            }

        });
    }

    $scope.$on('crypto-update', function(e, data) {
        var c = 0;
        $scope.$apply(scop => {
            Object.keys(data).forEach((e) => {
                scop.currencies[e] = parseFloat(data[e]).toFixed(2)
            });
        });  
        if($scope.time){
            $scope.getData()
            $scope.time = !$scope.time
        }
    });

    $scope.getData = () => {
        $http.get('/investor/data').then(res => {
            res.data.forEach(async item => {
                var key = item.base_name.toLowerCase();
                await $http.get('https://api.coincap.io/v2/assets/'+key).then(res => {
                    $scope.currencies[key] = ($scope.currencies[key] != 0) ? res.data.data.priceUsd:$scope.currencies[key];
                    $scope.user.fondos += item.fondos * $scope.currencies[key];
                    $scope.user.holdings.push(item);
                    $scope.user.raw += item.fondos;
                });
            });
            $rootScope.$broadcast('user-data', {info: $scope.currencies, user: $scope.user});
            $rootScope.$broadcast('modal-data', {quantity: $scope.user.raw});
        });
    }


    angular.element(document).ready(function(){
        
        $.AdminBSB.browser.activate();
        $.AdminBSB.leftSideBar.activate();
        $.AdminBSB.rightSideBar.activate();
        $.AdminBSB.navbar.activate();
        $.AdminBSB.dropdownMenu.activate();
        $.AdminBSB.input.activate();
        $.AdminBSB.select.activate();

        setTimeout(function () { 
            $('.page-loader-wrapper').fadeOut(); 

            $("[convertable]").each((pos, item) => {

                $(item).popover({
                    animation:true,
                    html:true,
                    content:'USD',
                });
            });

        }, 50);
    });
});

if (typeof jQuery === undefined) {
    throw new Error("jQuery plugins need to be before this file");
}

$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

$.AdminBSB = {};
$.AdminBSB.options = {
    colors: {
        red: '#F44336',
        pink: '#E91E63',
        purple: '#9C27B0',
        deepPurple: '#673AB7',
        indigo: '#3F51B5',
        blue: '#2196F3',
        lightBlue: '#03A9F4',
        cyan: '#00BCD4',
        teal: '#009688',
        green: '#4CAF50',
        lightGreen: '#8BC34A',
        lime: '#CDDC39',
        yellow: '#ffe821',
        amber: '#FFC107',
        orange: '#FF9800',
        deepOrange: '#FF5722',
        brown: '#795548',
        grey: '#9E9E9E',
        blueGrey: '#607D8B',
        black: '#000000',
        white: '#ffffff'
    },
    leftSideBar: {
        scrollColor: 'rgba(0,0,0,0.5)',
        scrollWidth: '4px',
        scrollAlwaysVisible: false,
        scrollBorderRadius: '0',
        scrollRailBorderRadius: '0',
        scrollActiveItemWhenPageLoad: true,
        breakpointWidth: 1170
    },
    dropdownMenu: {
        effectIn: 'fadeIn',
        effectOut: 'fadeOut'
    }
}

$.AdminBSB.leftSideBar = {
    activate: function () {
        var _this = this;
        var $body = $('body');
        var $overlay = $('.overlay');

        //Close sidebar
        $(window).click(function (e) {
            var $target = $(e.target);
            if (e.target.nodeName.toLowerCase() === 'i') { $target = $(e.target).parent(); }

            if (!$target.hasClass('bars') && _this.isOpen() && $target.parents('#leftsidebar').length === 0) {
                if (!$target.hasClass('js-right-sidebar')) $overlay.fadeOut();
                $body.removeClass('overlay-open');
            }
        });

        $.each($('.menu-toggle.toggled'), function (i, val) {
            $(val).next().slideToggle(0);
        });

        //When page load
        $.each($('.menu .list li.active'), function (i, val) {
            var $activeAnchors = $(val).find('a:eq(0)');

            $activeAnchors.addClass('toggled');
            $activeAnchors.next().show();
        });

        //Collapse or Expand Menu
        $('.menu-toggle').on('click', function (e) {
            var $this = $(this);
            var $content = $this.next();

            if ($($this.parents('ul')[0]).hasClass('list')) {
                var $not = $(e.target).hasClass('menu-toggle') ? e.target : $(e.target).parents('.menu-toggle');

                $.each($('.menu-toggle.toggled').not($not).next(), function (i, val) {
                    if ($(val).is(':visible')) {
                        $(val).prev().toggleClass('toggled');
                        $(val).slideUp();
                    }
                });
            }

            $this.toggleClass('toggled');
            $content.slideToggle(320);
        });

        //Set menu height
        _this.setMenuHeight();
        _this.checkStatuForResize(true);
        $(window).resize(function () {
            _this.setMenuHeight();
            _this.checkStatuForResize(false);
        });

        //Set Waves
        Waves.attach('.menu .list a', ['waves-block']);
        Waves.init();
    },
    setMenuHeight: function (isFirstTime) {
        if (typeof $.fn.slimScroll != 'undefined') {
            var configs = $.AdminBSB.options.leftSideBar;
            var height = ($(window).height() - ($('.legal').outerHeight() + $('.user-info').outerHeight() + $('.navbar').innerHeight()));
            var $el = $('.list');

            $el.slimscroll({
                height: height + "px",
                color: configs.scrollColor,
                size: configs.scrollWidth,
                alwaysVisible: configs.scrollAlwaysVisible,
                borderRadius: configs.scrollBorderRadius,
                railBorderRadius: configs.scrollRailBorderRadius
            });

            //Scroll active menu item when page load, if option set = true
            if ($.AdminBSB.options.leftSideBar.scrollActiveItemWhenPageLoad) {
                var activeItemOffsetTop = $('.menu .list li.active')[0].offsetTop
                if (activeItemOffsetTop > 150) $el.slimscroll({ scrollTo: activeItemOffsetTop + 'px' });
            }
        }
    },
    checkStatuForResize: function (firstTime) {
        var $body = $('body');
        var $openCloseBar = $('.navbar .navbar-header .bars');
        var width = $body.width();

        if (firstTime) {
            $body.find('.content, .sidebar').addClass('no-animate').delay(1000).queue(function () {
                $(this).removeClass('no-animate').dequeue();
            });
        }

        if (width < $.AdminBSB.options.leftSideBar.breakpointWidth) {
            $body.addClass('ls-closed');
            $openCloseBar.fadeIn();
        }
        else {
            $body.removeClass('ls-closed');
            $openCloseBar.fadeOut();
        }
    },
    isOpen: function () {
        return $('body').hasClass('overlay-open');
    }
};


$.AdminBSB.rightSideBar = {
    activate: function () {
        var _this = this;
        var $sidebar = $('#rightsidebar');
        var $overlay = $('.overlay');

        //Close sidebar
        $(window).click(function (e) {
            var $target = $(e.target);
            if (e.target.nodeName.toLowerCase() === 'i') { $target = $(e.target).parent(); }

            if (!$target.hasClass('js-right-sidebar') && _this.isOpen() && $target.parents('#rightsidebar').length === 0) {
                if (!$target.hasClass('bars')) $overlay.fadeOut();
                $sidebar.removeClass('open');
            }
        });

        $('.js-right-sidebar').on('click', function () {
            $sidebar.toggleClass('open');
            if (_this.isOpen()) { $overlay.fadeIn(); } else { $overlay.fadeOut(); }
        });
    },
    isOpen: function () {
        return $('.right-sidebar').hasClass('open');
    }
}


$.AdminBSB.navbar = {
    activate: function () {
        var $body = $('body');
        var $overlay = $('.overlay');

        //Open left sidebar panel
        $('.bars').on('click', function () {
            $body.toggleClass('overlay-open');
            if ($body.hasClass('overlay-open')) { $overlay.fadeIn(); } else { $overlay.fadeOut(); }
        });

        //Close collapse bar on click event
        $('.nav [data-close="true"]').on('click', function () {
            var isVisible = $('.navbar-toggle').is(':visible');
            var $navbarCollapse = $('.navbar-collapse');

            if (isVisible) {
                $navbarCollapse.slideUp(function () {
                    $navbarCollapse.removeClass('in').removeAttr('style');
                });
            }
        });
    }
}


$.AdminBSB.input = {
    activate: function () {
        //On focus event
        $('.form-control').focus(function () {
            $(this).parent().addClass('focused');
        });

        //On focusout event
        $('.form-control').focusout(function () {
            var $this = $(this);
            if ($this.parents('.form-group').hasClass('form-float')) {
                if ($this.val() == '') { $this.parents('.form-line').removeClass('focused'); }
            }
            else {
                $this.parents('.form-line').removeClass('focused');
            }
        });

        //On label click
        $('body').on('click', '.form-float .form-line .form-label', function () {
            $(this).parent().find('input').focus();
        });

        //Not blank form
        $('.form-control').each(function () {
            if ($(this).val() !== '') {
                $(this).parents('.form-line').addClass('focused');
            }
        });
    }
}


$.AdminBSB.select = {
    activate: function () {
        if ($.fn.selectpicker) { $('select:not(.ms)').selectpicker(); }
    }
}


$.AdminBSB.dropdownMenu = {
    activate: function () {
        var _this = this;

        $('.dropdown, .dropup, .btn-group').on({
            "show.bs.dropdown": function () {
                var dropdown = _this.dropdownEffect(this);
                _this.dropdownEffectStart(dropdown, dropdown.effectIn);
            },
            "shown.bs.dropdown": function () {
                var dropdown = _this.dropdownEffect(this);
                if (dropdown.effectIn && dropdown.effectOut) {
                    _this.dropdownEffectEnd(dropdown, function () { });
                }
            },
            "hide.bs.dropdown": function (e) {
                var dropdown = _this.dropdownEffect(this);
                if (dropdown.effectOut) {
                    e.preventDefault();
                    _this.dropdownEffectStart(dropdown, dropdown.effectOut);
                    _this.dropdownEffectEnd(dropdown, function () {
                        dropdown.dropdown.removeClass('open');
                    });
                }
            }
        });

        //Set Waves
        Waves.attach('.dropdown-menu li a', ['waves-block']);
        Waves.init();
    },
    dropdownEffect: function (target) {
        var effectIn = $.AdminBSB.options.dropdownMenu.effectIn, effectOut = $.AdminBSB.options.dropdownMenu.effectOut;
        var dropdown = $(target), dropdownMenu = $('.dropdown-menu', target);

        if (dropdown.length > 0) {
            var udEffectIn = dropdown.data('effect-in');
            var udEffectOut = dropdown.data('effect-out');
            if (udEffectIn !== undefined) { effectIn = udEffectIn; }
            if (udEffectOut !== undefined) { effectOut = udEffectOut; }
        }

        return {
            target: target,
            dropdown: dropdown,
            dropdownMenu: dropdownMenu,
            effectIn: effectIn,
            effectOut: effectOut
        };
    },
    dropdownEffectStart: function (data, effectToStart) {
        if (effectToStart) {
            data.dropdown.addClass('dropdown-animating');
            data.dropdownMenu.addClass('animated dropdown-animated');
            data.dropdownMenu.addClass(effectToStart);
        }
    },
    dropdownEffectEnd: function (data, callback) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        data.dropdown.one(animationEnd, function () {
            data.dropdown.removeClass('dropdown-animating');
            data.dropdownMenu.removeClass('animated dropdown-animated');
            data.dropdownMenu.removeClass(data.effectIn);
            data.dropdownMenu.removeClass(data.effectOut);

            if (typeof callback == 'function') {
                callback();
            }
        });
    }
}


var edge = 'Microsoft Edge';
var ie10 = 'Internet Explorer 10';
var ie11 = 'Internet Explorer 11';
var opera = 'Opera';
var firefox = 'Mozilla Firefox';
var chrome = 'Google Chrome';
var safari = 'Safari';

$.AdminBSB.browser = {
    activate: function () {
        var _this = this;
        var className = _this.getClassName();

        if (className !== '') $('html').addClass(_this.getClassName());
    },
    getBrowser: function () {
        var userAgent = navigator.userAgent.toLowerCase();

        if (/edge/i.test(userAgent)) {
            return edge;
        } else if (/rv:11/i.test(userAgent)) {
            return ie11;
        } else if (/msie 10/i.test(userAgent)) {
            return ie10;
        } else if (/opr/i.test(userAgent)) {
            return opera;
        } else if (/chrome/i.test(userAgent)) {
            return chrome;
        } else if (/firefox/i.test(userAgent)) {
            return firefox;
        } else if (!!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/)) {
            return safari;
        }

        return undefined;
    },
    getClassName: function () {
        var browser = this.getBrowser();

        if (browser === edge) {
            return 'edge';
        } else if (browser === ie11) {
            return 'ie11';
        } else if (browser === ie10) {
            return 'ie10';
        } else if (browser === opera) {
            return 'opera';
        } else if (browser === chrome) {
            return 'chrome';
        } else if (browser === firefox) {
            return 'firefox';
        } else if (browser === safari) {
            return 'safari';
        } else {
            return '';
        }
    }
}