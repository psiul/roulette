select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 165 and ss.ss_hash <= 365 and i.i_hash >= 264 and i.i_hash <= 764
;
