select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 162 and ss.ss_hash <= 912 and c.c_hash >= 301 and c.c_hash <= 634 and i.i_hash >= 255 and i.i_hash <= 655
;
