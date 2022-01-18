select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 282 and ss.ss_hash <= 615 and cd.cd_hash >= 497 and cd.cd_hash <= 897 and i.i_hash >= 219 and i.i_hash <= 969
;
