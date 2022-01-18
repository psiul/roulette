select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,item i,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 157 and ss.ss_hash <= 907 and c.c_hash >= 378 and c.c_hash <= 711 and i.i_hash >= 504 and i.i_hash <= 904
;
