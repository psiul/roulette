select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 335 and ss.ss_hash <= 435 and hd.hd_hash >= 148 and hd.hd_hash <= 648 and c.c_hash >= 385 and c.c_hash <= 585
;
