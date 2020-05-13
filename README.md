# Oxid Product List Slider

## Description

Replace existing product sliders with modern swiper implementation.

https://swiperjs.com/

![](shop1.png)

## Install

1. Copy files into following directory

        source/modules/rs/productlistslider
        
2. Add following to composer.json on the shop root

        "autoload": {
            "psr-4": {
                "rs\\productlistslider\\": "./source/modules/rs/productlistslider"
            }
        },
    
3. Refresh autoloader files with composer.

        composer dump-autoload

4. Template changes:

    In the file /var/www/html/oxid6_1_dev/source/Application/views/wave_cust/tpl/widget/product/list.tpl add following: 

        ...
        [{if $products && !empty($products)}]
            [{* rs-productlistslider start *}]
            [{block name="rs_productlistslider"}]
            [{* rs-productlistslider end *}]
            [{math equation="x / y" x=12 y=$iProductsPerLine assign="iColIdent"}]

            <div class="list-container" id="[{$listId}]">
        
                ....

                [{counter print=false assign="productlistCounter" start=0}]
            </div>
            [{* rs-productlistslider start *}]
            [{/block}]
            [{* rs-productlistslider end *}]
        ....


5. Enable module in the oxid admin area, Extensions => Modules

6. Clear template and language cache

