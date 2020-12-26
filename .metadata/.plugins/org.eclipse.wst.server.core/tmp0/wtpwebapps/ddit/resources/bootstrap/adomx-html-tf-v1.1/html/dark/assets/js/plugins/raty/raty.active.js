(function ($) {
    "use strict";

    $.fn.raty.defaults.path = 'assets/images/rating/'

    // Default
    if( $('.rating-default').length ) {
        $('.rating-default').raty();
    }

    // Score
    if( $('.rating-score').length ) {
        $('.rating-score').raty({
            score: 3,
            scoreName: 'entity[1,2,3,4,5]'
        });
    }

    // Score Name
    if( $('.rating-score-name').length ) {
        $('.rating-score-name').raty({
            scoreName: 'Rating'
        });
    }

    // Number
    if( $('.rating-number').length ) {
        $('.rating-number').raty({
            number: 10
        });
    }

    // Number Max
    if( $('.rating-number-max').length ) {
        $('.rating-number-max').raty({
            numberMax: 5,
            number: 10
        });
    }

    // Read Only
    if( $('.rating-read-only').length ) {
        $('.rating-read-only').raty({
            readOnly: true
        });
    }
    if( $('.rating-read-only2').length ) {
        $('.rating-read-only2').raty({
            readOnly: true,
            score: 3
        });
    }

    // Not Rated Message
    if( $('.rating-not-rated-msg').length ) {
        $('.rating-not-rated-msg').raty({
            readOnly: true,
            noRatedMsg : "Custom not rated message"
        });
    }

    // Half Show
    if( $('.rating-half-enable').length ) {
        $('.rating-half-enable').raty({
        	 score: 2.5
        });
    }
    if( $('.rating-half-disable').length ) {
        $('.rating-half-disable').raty({
            halfShow: false,
            score: 2.5
        });
    }

    // Half Rating
    if( $('.rating-half').length ) {
        $('.rating-half').raty({
            half: true
        });
    }

    // Hint
    if( $('.rating-hint').length ) {
        $('.rating-hint').raty({
            hints: ['a', null, '', undefined, '*_*']
        });
    }

    // Path
    if( $('.rating-path').length ) {
        $('.rating-path').raty({
            path: 'assets/images/rating/'
        });
    }

    // Cancel
    if( $('.rating-cancel').length ) {
        $('.rating-cancel').raty({
            cancel: true
        });
    }

    // Custom Icon
    if( $('.rating-custom-icon').length ) {
        $('.rating-custom-icon').raty({
            starHalf: 'like-half.png',
            starOn: 'like-on.png',
            starOff: 'like-off.png',
        });
    }

    // Icon Font
    if( $('.rating-font').length ) {
        $('.rating-font').raty({
            starHalf: 'zmdi zmdi-star-half',
            starOn: 'zmdi zmdi-star',
            starOff: 'zmdi zmdi-star-outline',
            starType: 'i',
            half: true
        });
    }
    
    // Icon Font 0.5
    if( $('.rating-font0.5').length ) {
    	$('.rating-font0.5').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score: 0.5
    	});
    }
    // Icon Font 1
    if( $('.rating-font1').length ) {
    	$('.rating-font1').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 1
    	});
    }
    // Icon Font 1.5
    if( $('.rating-font1.5').length ) {
    	$('.rating-font1.5').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score: 1.5
    	});
    }
    // Icon Font 2
    if( $('.rating-font2').length ) {
    	$('.rating-font2').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 2
    	});
    }
    // Icon Font 2.5
    if( $('.rating-font2.5').length ) {
    	$('.rating-font2.5').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 2.5
    	});
    }
    // Icon Font 3
    if( $('.rating-font3').length ) {
    	$('.rating-font3').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 3
    	});
    }
    // Icon Font 3.5
    if( $('.rating-font3.5').length ) {
    	$('.rating-font3.5').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 3.5
    	});
    }
    // Icon Font 4
    if( $('.rating-font4').length ) {
    	$('.rating-font4').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 4
    	});
    }
    // Icon Font 4.5
    if( $('.rating-font4.5').length ) {
    	$('.rating-font4.5').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 4.5
    		
    	});
    }
    // Icon Font 5
    if( $('.rating-font5.0').length ) {
    	$('.rating-font5.0').raty({
    		starHalf: 'zmdi zmdi-star-half',
    		starOn: 'zmdi zmdi-star',
    		starOff: 'zmdi zmdi-star-outline',
    		starType: 'i',
    		half: true,
    		score : 5
    	});
    }

    // Icon Range
    if( $('.rating-icon-range').length ) {
        $('.rating-icon-range').raty({
            starType: 'i',
            iconRange: [
                { range: 1, on: 'zmdi zmdi-star', off: 'zmdi zmdi-star-outline' },
                { range: 2, on: 'zmdi zmdi-lock', off: 'zmdi zmdi-lock-outline' },
                { range: 3, on: 'zmdi zmdi-favorite', off: 'zmdi zmdi-favorite-outline' },
                { range: 4, on: 'zmdi zmdi-check-square', off: 'zmdi zmdi-square-o' },
                { range: 5, on: 'zmdi zmdi-volume-up', off: 'zmdi zmdi-volume-mute' }
            ]
        });
    }
    
})(jQuery);