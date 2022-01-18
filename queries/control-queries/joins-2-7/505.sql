select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 423 and ss.ss_hash <= 623 and i.i_hash >= 353 and i.i_hash <= 853
;
