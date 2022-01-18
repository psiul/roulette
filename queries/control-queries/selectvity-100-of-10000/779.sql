select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 675 and ss.ss_hash <= 775 and hd.hd_hash >= 380 and hd.hd_hash <= 880 and c.c_hash >= 699 and c.c_hash <= 899
;
