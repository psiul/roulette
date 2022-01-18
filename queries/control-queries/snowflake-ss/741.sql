select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 189 and c.c_hash <= 589 and i.i_hash >= 612 and i.i_hash <= 945 and hd.hd_hash >= 239 and hd.hd_hash <= 989
;
