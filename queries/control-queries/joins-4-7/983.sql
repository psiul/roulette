select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 180 and ss.ss_hash <= 930 and cd.cd_hash >= 587 and cd.cd_hash <= 987 and hd.hd_hash >= 202 and hd.hd_hash <= 535
;
