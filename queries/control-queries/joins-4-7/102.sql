select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 518 and cd.cd_hash <= 851 and i.i_hash >= 211 and i.i_hash <= 961 and hd.hd_hash >= 484 and hd.hd_hash <= 884
;
