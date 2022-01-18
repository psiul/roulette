select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 84 and ss.ss_hash <= 584 and hd.hd_hash >= 405 and hd.hd_hash <= 505 and i.i_hash >= 686 and i.i_hash <= 886
;
