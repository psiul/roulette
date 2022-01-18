select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 178 and c.c_hash <= 928 and i.i_hash >= 632 and i.i_hash <= 965 and hd.hd_hash >= 473 and hd.hd_hash <= 873
;
