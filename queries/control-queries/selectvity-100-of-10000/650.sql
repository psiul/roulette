select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 731 and ss.ss_hash <= 931 and i.i_hash >= 685 and i.i_hash <= 785 and d.d_hash >= 463 and d.d_hash <= 963
;
