select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 479 and ss.ss_hash <= 812 and hd.hd_hash >= 459 and hd.hd_hash <= 859 and i.i_hash >= 58 and i.i_hash <= 808
;
