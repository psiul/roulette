select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 110 and ss.ss_hash <= 443 and cd.cd_hash >= 5 and cd.cd_hash <= 755 and c.c_hash >= 3 and c.c_hash <= 403
;
