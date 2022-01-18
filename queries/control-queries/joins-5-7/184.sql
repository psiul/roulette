select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 146 and hd.hd_hash <= 896 and cd.cd_hash >= 190 and cd.cd_hash <= 523 and i.i_hash >= 134 and i.i_hash <= 534
;
