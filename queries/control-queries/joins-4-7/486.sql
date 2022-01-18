select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 26 and cd.cd_hash <= 359 and hd.hd_hash >= 244 and hd.hd_hash <= 994 and i.i_hash >= 157 and i.i_hash <= 557
;
