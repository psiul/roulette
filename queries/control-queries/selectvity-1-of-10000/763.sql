select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 184 and ss.ss_hash <= 234 and cd.cd_hash >= 586 and cd.cd_hash <= 686 and i.i_hash >= 435 and i.i_hash <= 455
;
