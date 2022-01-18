select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 146 and c.c_hash <= 479 and i.i_hash >= 177 and i.i_hash <= 927 and hd.hd_hash >= 506 and hd.hd_hash <= 906
;
