select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 210 and cd.cd_hash <= 610 and hd.hd_hash >= 128 and hd.hd_hash <= 878 and i.i_hash >= 260 and i.i_hash <= 593
;
