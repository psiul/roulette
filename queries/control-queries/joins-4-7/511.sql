select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 89 and ss.ss_hash <= 839 and hd.hd_hash >= 2 and hd.hd_hash <= 402 and cd.cd_hash >= 318 and cd.cd_hash <= 651
;
