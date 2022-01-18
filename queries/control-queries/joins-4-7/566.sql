select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 94 and cd.cd_hash <= 844 and i.i_hash >= 404 and i.i_hash <= 804 and hd.hd_hash >= 556 and hd.hd_hash <= 889
;
