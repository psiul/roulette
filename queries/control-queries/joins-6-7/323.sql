select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 532 and d.d_hash <= 865 and hd.hd_hash >= 21 and hd.hd_hash <= 771 and i.i_hash >= 480 and i.i_hash <= 880
;
