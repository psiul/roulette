select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 3 and ss.ss_hash <= 753 and cd.cd_hash >= 233 and cd.cd_hash <= 566 and i.i_hash >= 392 and i.i_hash <= 792
;
