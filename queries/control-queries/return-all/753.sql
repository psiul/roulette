select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,household_demographics hd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 474 and ss.ss_hash <= 874 and hd.hd_hash >= 178 and hd.hd_hash <= 928 and i.i_hash >= 325 and i.i_hash <= 658
;
