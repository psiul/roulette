select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 575 and ss.ss_hash <= 908 and d.d_hash >= 227 and d.d_hash <= 977 and i.i_hash >= 398 and i.i_hash <= 798
;
