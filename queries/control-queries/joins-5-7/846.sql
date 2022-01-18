select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 438 and hd.hd_hash <= 771 and cd.cd_hash >= 148 and cd.cd_hash <= 548 and i.i_hash >= 193 and i.i_hash <= 943
;
