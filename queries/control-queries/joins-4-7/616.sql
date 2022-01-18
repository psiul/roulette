select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 201 and cd.cd_hash <= 534 and hd.hd_hash >= 207 and hd.hd_hash <= 957 and i.i_hash >= 87 and i.i_hash <= 487
;
