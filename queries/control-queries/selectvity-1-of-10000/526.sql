select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 684 and ss.ss_hash <= 784 and hd.hd_hash >= 831 and hd.hd_hash <= 881 and c.c_hash >= 196 and c.c_hash <= 216
;
