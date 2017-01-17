
( function( $ ) {
	
	var supernova = {

		init : function()
		{
			this.settings();
			this.defaultEvents();
		},

		settings : function()
		{

		},

		defaultEvents : function()
		{
			var adminBarHeight = $( '#wpadminbar' ).length ? 32 : 0;

			this.buyButtonChange();	
			$(window).load( supernova.demoAnimation(1200, 500));

			$('#masthead').sticky({
				topSpacing: adminBarHeight
			});
		},

		demoAnimation : function( _animationTime, _interval )
		{
			var _demo = $('#demo'),
				_versions = _demo.find('img:not(".loader")').hide();
			var count = 0;
			var animation = false;

			_versions.load(function(){			
				count++;
				if( count < 4 ) return;
				do_animation();
			});

			$(window).load(function() {
				do_animation();
			});

			setTimeout(function(){
				do_animation();
			}, 5000 );

			function do_animation(){
				if(!animation){
					_demo.find('.loader').fadeOut('slow');
					_demo.find(".desktop").fadeIn('slow').css('right', '1200px').animate( { right : 200 }, _animationTime );	
					_demo.find(".laptop").fadeIn('slow').css('bottom', '-1200px').animate( { bottom : 0 }, _animationTime );
					_demo.find(".mobile").fadeIn('slow').css('left', '1200px').animate( { left : 140 }, _animationTime );
					_demo.find(".tablet").fadeIn('slow').css('bottom', '1200px').animate( { bottom : 0 }, _animationTime );
					animation = true;
				}
			}

		},

		buyButtonChange : function()
		{			
			$('.price-boxes .edd-add-to-cart-label').html('Buy').fadeIn();
			$('.page-template-page-templatespricing-php .price-boxes .buy').fadeIn();		
					
			var whyPro = $('#why-pro');
			var whyProRow = whyPro.find('.row:not("#touch-friendly, #infinite-scroll")'); 
			var touchFriendly = $('#touch-friendly');
			var infiniteScroll = $('#infinite-scroll');
			var whyProBg = whyProRow.find('img');			


			var x = 0;  
			var y = 0; 

			var x2 = 0;
			var y2 = 0;

			var x3 = 0;
			var y3 = 0; 			
			
			whyProRow.css('backgroundPosition', x + 'px' + ' ' + y + 'px');			
			window.setInterval(function() {  
				 whyProRow.css("backgroundPosition", x + 'px' + ' ' + y + 'px');  
				 //y--;  
				 x--;
			}, 90); 
			
			touchFriendly.css('backgroundPosition', x2 + 'px' + ' ' + y2 + 'px');
			window.setInterval(function() {  
				 touchFriendly.css("backgroundPosition", x2 + 'px' + ' ' + y2 + 'px');  
				 y2--;  
				 //x--;
			}, 90);			

			infiniteScroll.css('backgroundPosition', x3 + 'px' + ' ' + y3 + 'px');
			window.setInterval(function() {  
				 infiniteScroll.css("backgroundPosition", x3 + 'px' + ' ' + y3 + 'px');  
				 y3--;  
				 //x--;
			}, 90);


		}

	};

 	$( document ).ready( function() {
	    supernova.init();
 	} )

} )( jQuery );
