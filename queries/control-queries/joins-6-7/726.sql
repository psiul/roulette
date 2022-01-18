select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 351 and c.c_hash <= 684 and hd.hd_hash >= 193 and hd.hd_hash <= 593 and d.d_hash >= 228 and d.d_hash <= 978
;
