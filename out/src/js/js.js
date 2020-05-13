"use strict";

let rs_productlistslider_calculate_viewport_size = "";
let rs_productlistslider_slider_manager = [];

/**
 * normal view, small view
 */
function rs_productlistslider_calculate_viewport() {
    let viewportWidth = window.innerWidth || document.documentElement.clientWidth;
    let html = document.getElementsByTagName('html')[0];
    let size = "";
    if(viewportWidth<600)
    {
        html.classList.remove('rs-productlistslider-large');
        html.classList.remove('rs-productlistslider-medium');
        html.classList.add('rs-productlistslider-small');
        size = "small";
    }
    else if(viewportWidth<1000)
    {
        html.classList.remove('rs-productlistslider-large');
        html.classList.remove('rs-productlistslider-small');
        html.classList.add('rs-productlistslider-medium');
        size = "medium";
    }
    else
    {
        html.classList.remove('rs-productlistslider-small');
        html.classList.remove('rs-productlistslider-medium');
        html.classList.add('rs-productlistslider-large');
        size = "large";
    }
    
    if(size !== rs_productlistslider_calculate_viewport_size)
    {
        rs_productlistslider_calculate_viewport_size = size;
        rs_productlistslider_slider_reinit_all();
    } 
}

rs_productlistslider_calculate_viewport();

window.addEventListener("resize", function(){
    rs_productlistslider_calculate_viewport();
});






class rs_productlistslider_slider {

    constructor(id, slidesPerView) {
        this.id = id;
        this.slidesPerView = slidesPerView;
        this.init();
    }

    init() {

      this.swiper = new Swiper ('#' + this.id, {
        // Optional parameters
        direction: 'horizontal',
        slidesPerView: this.getSliderPerView(),
        loop: true,

        // If we need pagination
        /*
        pagination: {
          el: '.swiper-pagination',
        },
         */

        // Navigation arrows
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },

        // And if we need scrollbar
        /*
        scrollbar: {
          el: '.swiper-scrollbar',
        },
         */
      });
    }

    getSliderPerView() {
        let size = rs_productlistslider_calculate_viewport_size;
        let ret = this.slidesPerView;
        
        if(size==="small")
        {
            ret = 1;
        }
        else if(size==="medium")
        {
            ret = Math.ceil(ret/2);
        }
        
        if(ret < 0)
        {
            ret = 1;
        } 
        
        return ret;
    }

    reInit() {
        if(this.swiper!==null)
        {
            this.swiper.params.slidesPerView = this.getSliderPerView();
            this.swiper.update();
        }
    }
}

function rs_productlistslider_slider_create(id, slidesPerView)
{
    let slider = new rs_productlistslider_slider(id, slidesPerView);
    rs_productlistslider_slider_manager.push(slider);
}
function rs_productlistslider_slider_reinit_all() {
    rs_productlistslider_slider_manager.forEach(function(slider) {
        slider.reInit();
    });
}
let tmp = document.getElementsByClassName('rs_productlistslider');
Array.prototype.filter.call(tmp, function(el){
    let type = el.getAttribute('data-type');
    let id = el.id;
    /* change some classes */
    if(type=="infogrid")
    {
        $('#' + id + ' > div > div > form > div.row > div.col-lg-5').removeClass('col-12').removeClass('col-lg-5').addClass('col-5');
        $('#' + id + ' > div > div > form > div.row > div.col-lg-7').removeClass('col-12').removeClass('col-lg-7').addClass('col-7');
    }
    rs_productlistslider_slider_create(id, el.getAttribute('data-slidesPerView'));
});