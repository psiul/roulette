select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 20 and ss.ss_hash <= 353 and i.i_hash >= 595 and i.i_hash <= 995 and c.c_hash >= 157 and c.c_hash <= 907
;
