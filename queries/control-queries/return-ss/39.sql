select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 13 and ss.ss_hash <= 763 and i.i_hash >= 241 and i.i_hash <= 574 and hd.hd_hash >= 89 and hd.hd_hash <= 489
;
