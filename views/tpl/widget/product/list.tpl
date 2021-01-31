[{oxscript include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/swiper-5.3.8/package/js/swiper.min.js")}]
[{oxscript include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/js/js.js")}]
[{oxstyle include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/swiper-5.3.8/package/css/swiper.min.css")}]
[{oxstyle include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/css/css.css")}]

[{assign var=config value=$oViewConf->getConfig()}]
[{assign var=navi_pagination value=$config->getConfigParam('rs-productslider_settings_navigation_pagination')}]
[{assign var=navi_buttons value=$config->getConfigParam('rs-productslider_settings_navigation_button')}]
[{assign var=navi_scrollbar value=$config->getConfigParam('rs-productslider_settings_navigation_scrollbar')}]
[{assign var=infinityLoop value=$config->getConfigParam('rs-productslider_settings_infinity_loop')}]

[{math equation="x / y" x=12 y=$iProductsPerLine assign="iColIdent"}]
<div 
    class="list-container swiper-container rs_productlistslider" 
    data-type="[{$type}]" 
    data-slidesPerView="[{$iProductsPerLine}]" 
    id="[{$listId}]"
    data-naviPagination="[{if $navi_pagination}]1[{else}]0[{/if}]"
    data-naviButtons="[{if $navi_buttons}]1[{else}]0[{/if}]"
    data-naviScrollbar="[{if $navi_scrollbar}]1[{else}]0[{/if}]"
    data-infinityLoop="[{if $infinityLoop}]1[{else}]0[{/if}]"
    >
    <div class="[{*row*}] [{$type}]-view newItems swiper-wrapper">
    [{foreach from=$products item="_product" name="productlist"}]
        [{counter print=false assign="productlistCounter"}]
        [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]

        <div class="productData [{*col-12[{if $type != 'line'}] col-sm-6 col-md-4 col-lg-[{$iColIdent}][{/if}]*}] productBox product-box swiper-slide">
            [{oxid_include_widget 
               cl="oxwArticleBox" 
               _parent=$oView->getClassName() 
               nocookie=1 
               _navurlparams=$oViewConf->getNavUrlParams() 
               iLinkType=$_product->getLinkType() 
               _object=$_product 
               anid=$_product->getId() 
               sWidgetType=product 
               sListType=listitem_$type 
               iIndex=$testid 
               blDisableToCart=$blDisableToCart 
               isVatIncluded=$oView->isVatIncluded() 
               showMainLink=$showMainLink 
               recommid=$recommid 
               owishid=$owishid 
               toBasketFunction=$toBasketFunction 
               removeFunction=$removeFunction 
               altproduct=$altproduct 
               inlist=$_product->isInList() 
               skipESIforUser=1 
               testid=$testid
            }]
        </div>

    [{/foreach}]
    </div>

    [{if $navi_pagination}]
        <div class="swiper-pagination"></div>
    [{/if}]

    [{if $navi_buttons}]
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    [{/if}]

    [{if $navi_scrollbar}]
        <div class="swiper-scrollbar"></div>
    [{/if}]
    
    [{* Counter resetten *}]
    [{counter print=false assign="productlistCounter" start=0}]
</div>