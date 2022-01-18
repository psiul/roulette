select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,store_returns sr,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 273 and c.c_hash <= 673 and i.i_hash >= 562 and i.i_hash <= 895 and d.d_hash >= 145 and d.d_hash <= 895
;
