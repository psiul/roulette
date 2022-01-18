select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 261 and hd.hd_hash <= 594 and cd.cd_hash >= 139 and cd.cd_hash <= 889 and i.i_hash >= 537 and i.i_hash <= 937
;
