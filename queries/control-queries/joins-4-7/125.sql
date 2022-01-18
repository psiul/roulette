select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 229 and ss.ss_hash <= 562 and cd.cd_hash >= 129 and cd.cd_hash <= 879 and hd.hd_hash >= 104 and hd.hd_hash <= 504
;
