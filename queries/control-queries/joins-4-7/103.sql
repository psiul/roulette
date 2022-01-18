select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 360 and ss.ss_hash <= 760 and i.i_hash >= 138 and i.i_hash <= 471 and hd.hd_hash >= 28 and hd.hd_hash <= 778
;
