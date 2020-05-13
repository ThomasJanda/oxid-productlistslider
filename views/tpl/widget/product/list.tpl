[{oxscript include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/swiper-5.3.8/package/js/swiper.min.js")}]
[{oxscript include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/js/js.js")}]
[{oxstyle include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/swiper-5.3.8/package/css/swiper.min.css")}]
[{oxstyle include=$oViewConf->getModuleUrl("rs-productlistslider", "out/src/css/css.css")}]

[{math equation="x / y" x=12 y=$iProductsPerLine assign="iColIdent"}]

<div class="list-container swiper-container rs_productlistslider" data-type="[{$type}]" data-slidesPerView="[{$iProductsPerLine}]" id="[{$listId}]">
    <div class="[{*row*}] [{$type}]-view newItems swiper-wrapper">
    [{foreach from=$products item="_product" name="productlist"}]
        [{counter print=false assign="productlistCounter"}]
        [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]


        <div class="productData [{*col-12[{if $type != 'line'}] col-sm-6 col-md-4 col-lg-[{$iColIdent}][{/if}]*}] productBox product-box swiper-slide">
            [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]
        </div>

    [{/foreach}]
    </div>

    [{*
    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>
    *}]

    <!-- If we need navigation buttons -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>

    [{*
    <!-- If we need scrollbar -->
    <div class="swiper-scrollbar"></div>
    *}]
    
    [{* Counter resetten *}]
    [{counter print=false assign="productlistCounter" start=0}]
</div>