Date.now = Date.now || function() { return +new Date; };

+function ($) {

    $(function(){

        // toogle fullscreen
        $(document).on('click', "[data-toggle=fullscreen]", function(e){
            e.preventDefault();
            if (screenfull.enabled) {
                screenfull.request();
            }
        });

        // popover
        $("[data-toggle=popover]").popover();
        $(document).on('click', '.popover-title .close', function(e){
            var $target = $(e.target), $popover = $target.closest('.popover').prev();
            $popover && $popover.popover('hide');
        });

        // ajax modal
        $(document).on('click', '[data-toggle="ajaxModal"]',
            function(e) {
                $('#ajaxModal').remove();
                e.preventDefault();
                var $this = $(this)
                    , $remote = $this.data('remote') || $this.attr('href')
                    , $modal = $('<div class="modal fade" id="ajaxModal"><div class="modal-body"></div></div>');
                $('body').append($modal);
                $modal.modal();
                $modal.load($remote);
            }
        );

        // tooltip
        $("[data-toggle=tooltip]").tooltip();

        // class
        $(document).on('click', '[data-toggle^="class"]', function(e){
            e && e.preventDefault();
            var $this = $(e.target), $class , $target, $tmp, $classes, $targets;
            !$this.data('toggle') && ($this = $this.closest('[data-toggle^="class"]'));
            $class = $this.data()['toggle'];
            $target = $this.data('target') || $this.attr('href');
            $class && ($tmp = $class.split(':')[1]) && ($classes = $tmp.split(','));
            $target && ($targets = $target.split(','));
            $classes && $classes.length && $.each($targets, function( index, value ) {
                if ( $classes[index].indexOf( '*' ) !== -1 ) {
                    var patt = new RegExp( '\\s' +
                        $classes[index].
                        replace( /\*/g, '[A-Za-z0-9-_]+' ).
                        split( ' ' ).
                        join( '\\s|\\s' ) +
                        '\\s', 'g' );
                    $($this).each( function ( i, it ) {
                        var cn = ' ' + it.className + ' ';
                        while ( patt.test( cn ) ) {
                            cn = cn.replace( patt, ' ' );
                        }
                        it.className = $.trim( cn );
                    });
                }
                ($targets[index] !='#') && $($targets[index]).toggleClass($classes[index]) || $this.toggleClass($classes[index]);
            });
            $this.toggleClass('active');
        });

        // panel toggle
        $(document).on('click', '.panel-toggle', function(e){
            e && e.preventDefault();
            var $this = $(e.target), $class = 'collapse' , $target;
            if (!$this.is('a')) $this = $this.closest('a');
            $target = $this.closest('.panel');
            $target.find('.panel-body').toggleClass($class);
            $this.toggleClass('active');
        });

        // carousel
        $('.carousel.auto').carousel();

        // button loading
        $(document).on('click.button.data-api', '[data-loading-text]', function (e) {
            var $this = $(e.target);
            $this.is('i') && ($this = $this.parent());
            $this.button('loading');
        });

        var $window = $(window);
        // mobile
        var mobile = function(option){
            if(option == 'reset'){
                $('[data-toggle^="shift"]').shift('reset');
                return true;
            }
            $('[data-toggle^="shift"]').shift('init');
            return true;
        };
        // unmobile
        $window.width() < 768 && mobile();
        // resize
        var $resize, $width = $window.width();
        $window.resize(function() {
            if($width !== $window.width()){
                clearTimeout($resize);
                $resize = setTimeout(function(){
                    setHeight();
                    $window.width() < 768 && mobile();
                    $window.width() >= 768 && mobile('reset') && fixVbox();
                    $width = $window.width();
                }, 500);
            }
        });

        // fluid layout
        var setHeight = function(){
            $('.app-fluid #nav > *').css('min-height', $(window).height()-60);
            return true;
        }
        setHeight();

        // fix vbox
        var fixVbox = function(){
            $('.ie11 .vbox').each(function(){
                $(this).height($(this).parent().height());
            });
            return true;
        }
        fixVbox();

        // dropdown still
        $(document).on('click.bs.dropdown.data-api', '.dropdown .on, .dropup .on, .open .on', function (e) { e.stopPropagation() });

        $(document).on('click', '#nav .nav-primary a', function (e) {
            var $this = $(e.target), $active;
            $this.is('a') || ($this = $this.closest('a'));

            $active = $this.parent().siblings( ".active" );
            $active && $active.toggleClass('active').find('> ul:visible').slideUp(200);

            ($this.parent().hasClass('active') && $this.next().slideUp(200)) || $this.next().slideDown(200);
            $this.parent().toggleClass('active');

            $this.next().is('ul') && e.preventDefault();
            !$this.next().is('ul') && $('.navbar-header > a:first').css('display') !=='none' && $('.navbar-header > a:first').trigger('click');
        });



    });
}(jQuery);