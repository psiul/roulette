select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 188 and ss.ss_hash <= 938 and hd.hd_hash >= 330 and hd.hd_hash <= 730 and cd.cd_hash >= 259 and cd.cd_hash <= 592
;
