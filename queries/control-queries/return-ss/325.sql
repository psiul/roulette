select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 38 and ss.ss_hash <= 788 and d.d_hash >= 609 and d.d_hash <= 942 and i.i_hash >= 547 and i.i_hash <= 947
;
