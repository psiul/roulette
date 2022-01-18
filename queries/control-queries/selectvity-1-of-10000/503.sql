select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 573 and ss.ss_hash <= 593 and c.c_hash >= 683 and c.c_hash <= 783 and hd.hd_hash >= 336 and hd.hd_hash <= 386
;
