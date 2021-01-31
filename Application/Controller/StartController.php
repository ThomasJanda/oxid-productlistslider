<?php 

namespace rs\productlistslider\Application\Controller;

/**
 * Class StartController
 *
 * @package rs\productlistslider\Application\Controller
 * @see \OxidEsales\Eshop\Application\Controller\StartController
 *
 */
class StartController extends StartController_parent
{
    protected $loadActionList=[];

    public function loadActionList($id)
    {
        if (!isset($this->loadActionList[$id])) {
            $this->loadActionList[$id] = false;
            
            /** @var \OxidEsales\Eshop\Application\Model\ArticleList $oArtList */
            $oArtList = oxNew(\OxidEsales\Eshop\Application\Model\ArticleList::class);
            $oArtList->loadActionArticles($id);
            if ($oArtList->count()) {
                $this->loadActionList[$id] = $oArtList;
            }
        }

        return $this->loadActionList[$id];
    }
}
