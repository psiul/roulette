select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 294 and cd.cd_hash <= 627 and hd.hd_hash >= 67 and hd.hd_hash <= 467 and i.i_hash >= 175 and i.i_hash <= 925
;
