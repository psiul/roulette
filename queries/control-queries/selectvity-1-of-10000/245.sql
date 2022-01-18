select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 754 and ss.ss_hash <= 804 and c.c_hash >= 792 and c.c_hash <= 812 and i.i_hash >= 430 and i.i_hash <= 530
;
