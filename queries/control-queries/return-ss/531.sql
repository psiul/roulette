select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 337 and ss.ss_hash <= 670 and i.i_hash >= 353 and i.i_hash <= 753 and cd.cd_hash >= 116 and cd.cd_hash <= 866
;
