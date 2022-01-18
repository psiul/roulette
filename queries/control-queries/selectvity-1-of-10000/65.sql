select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 895 and ss.ss_hash <= 945 and d.d_hash >= 859 and d.d_hash <= 879 and i.i_hash >= 757 and i.i_hash <= 857
;
