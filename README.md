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

    In the file /var/www/html/oxid6_1_dev/source/Application/views/wave/tpl/widget/product/list.tpl add following: 

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

    In the file /var/www/html/oxid6_1_dev/source/Application/views/wave/tpl/page/shop/start.tpl add following: 

        ...
        [{* rs-productslider start *}]
        [{section name=list start=1 loop=10 step=1}]
            [{assign var=id value="rs_productlistslider_"|cat:$smarty.section.list.index}]
            [{assign var=head value=$id|cat:"_head"}]
            [{assign var=subhead value=$id|cat:"_subhead"}]
            [{assign var=list value=$oView->loadActionList($id)}]
            [{if $list}]
                [{include file="widget/product/list.tpl" type="infogrid" head=$head|oxmultilangassign subhead=$subhead|oxmultilangassign:$list->count() listId=$id products=$list showMainLink=true iProductsPerLine=4}]
            [{/if}]
        [{/section}]
        [{* rs-productslider end *}]

        [{insert name="oxid_tracker"}]
        ....

5. Execute following SQL statment to add more action lists to the start page

        INSERT INTO `oxactions` (`OXID`, `OXSHOPID`, `OXTYPE`, `OXTITLE`, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3) VALUES ('rs_productlistslider_1', '1', '1', 'Startpage Action List 1','','','','');
        INSERT INTO `oxactions` (`OXID`, `OXSHOPID`, `OXTYPE`, `OXTITLE`, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3) VALUES ('rs_productlistslider_2', '1', '1', 'Startpage Action List 2','','','','');
        INSERT INTO `oxactions` (`OXID`, `OXSHOPID`, `OXTYPE`, `OXTITLE`, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3) VALUES ('rs_productlistslider_3', '1', '1', 'Startpage Action List 3','','','','');
        INSERT INTO `oxactions` (`OXID`, `OXSHOPID`, `OXTYPE`, `OXTITLE`, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3) VALUES ('rs_productlistslider_4', '1', '1', 'Startpage Action List 4','','','','');
        INSERT INTO `oxactions` (`OXID`, `OXSHOPID`, `OXTYPE`, `OXTITLE`, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3) VALUES ('rs_productlistslider_5', '1', '1', 'Startpage Action List 5','','','','');

5. Enable module in the oxid admin area, Extensions => Modules

6. Clear template and language cache
