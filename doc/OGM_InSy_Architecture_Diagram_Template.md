# OGM.Insy Architecture Diagram Styling Template

## Prompt for Creating Styled Architecture Diagram

**Use this prompt with an AI assistant to recreate the OGM.Insy architecture diagram with proper visual hierarchy:**

---

I need you to create a Mermaid architecture diagram for the OGM.Insy AI platform with the following styling requirements:

### **Styling Rules:**
1. **Main Title**: Use `<h1 style='font-size: 2.5em; font-weight: bold; color: darkblue;'># OGM.Insy AI Platform Architecture</h1>` at the top

2. **Subgraph Titles**: 
   - Main sections: `<b style='font-size: 25px; color: green;'>[Section Name]</b>`
   - ETL/Embedding pipelines: `<b style='font-size: 25px; color: purple;'>[Pipeline Name]</b>`

3. **Node Labels**: 
   - First line: `<b style='font-size: 20px; color: red;'>[Component Name]</b>`
   - Followed by: `<br/>[Description]`
   - Additional details can follow with bullet points

### **Diagram Structure:**
Create a Mermaid graph LR with these subgraphs and nodes:

```
graph LR
    %% User - Starting Point
    USER["<b style='font-size: 20px; color: red;'>User</b><br/>Query Input"]

    %% User Interface - Entry Point
    subgraph "<b style='font-size: 25px; color: green;'>User Interface</b>"
        UI["<b style='font-size: 20px; color: red;'>Streamlit Web App</b><br/>(Interactive Portal)"]
        QUERY["<b style='font-size: 20px; color: red;'>User Query</b><br/>Input Processing"]
        RESULTS["<b style='font-size: 20px; color: red;'>LLM Results</b><br/>Response Display"]
        ENC["<b style='font-size: 20px; color: red;'>TLS 1.3 Encryption</b><br/>(HTTPS Security)"]
    end

    %% Authentication & Security
    subgraph "<b style='font-size: 25px; color: green;'>Authentication & Security</b>"
        AUTH["<b style='font-size: 20px; color: red;'>JWT/OAuth2</b><br/>(Multi-Factor Auth)"]
        FW["<b style='font-size: 20px; color: red;'>Web Application Firewall</b><br/>(XSS/SQL Protection)"]
    end

    %% Data Ingestion Layer
    subgraph "<b style='font-size: 25px; color: green;'>Data Sources</b>"
        TEXT_DATA["<b style='font-size: 20px; color: red;'>Text Data</b><br/>PDF, DOC, JSON, CSV"]
        MULTIMODAL["<b style='font-size: 20px; color: red;'>Multimodal Data</b><br/>Images, Audio, Video"]
        APIS["<b style='font-size: 20px; color: red;'>APIs</b><br/>(REST, GraphQL)"]
        DBS["<b style='font-size: 20px; color: red;'>Databases</b><br/>(SQL, NoSQL)"]
        WEB["<b style='font-size: 20px; color: red;'>Web Content</b><br/>(Crawling, RSS)"]
    end

    %% Multimodal Processing
    subgraph "<b style='font-size: 25px; color: green;'>Multimodal Processing</b>"
        LANG_DETECT["<b style='font-size: 20px; color: red;'>Language Detection</b><br/>(Auto ML Models)<br/>• 100+ languages<br/>• FastText models"]
        TRANSLATE["<b style='font-size: 20px; color: red;'>Translation Engine</b><br/>(Neural MT)<br/>• Transformer models<br/>• Real-time processing"]
        MODALITY_PROC["<b style='font-size: 20px; color: red;'>Modality Processor</b><br/>(Vision/Audio/NLP)<br/>• CLIP for images<br/>• Whisper for audio<br/>• OCR processing"]
        UNIMODAL_CONV["<b style='font-size: 20px; color: red;'>Unimodal Converter</b><br/>(Text Normalization)<br/>• Image→Text<br/>• Audio→Text<br/>• Video→Text"]
    end

    %% Security & Validation
    subgraph "<b style='font-size: 25px; color: green;'>Security Scanning</b>"
        MALWARE["<b style='font-size: 20px; color: red;'>Malware Scanner</b><br/>(Virus Detection)"]
        VALIDATE["<b style='font-size: 20px; color: red;'>Data Validator</b><br/>(Schema Validation)"]
        GATEWAY["<b style='font-size: 20px; color: red;'>API Gateway</b><br/>(Rate Limiting)"]
    end

    %% Data Processing Pipeline
    subgraph "<b style='font-size: 25px; color: green;'>Data Processing</b>"
        subgraph "<b style='font-size: 25px; color: purple;'>ETL Pipeline</b>"
            EXTRACT["<b style='font-size: 20px; color: red;'>Extract</b><br/>(Data Ingestion)<br/>• PDF, DOC, JSON, CSV<br/>• Incremental sync<br/>• API rate limiting"]
            TRANSFORM["<b style='font-size: 20px; color: red;'>Transform</b><br/>(Clean & Normalize)<br/>• Regex patterns<br/>• Schema validation<br/>• Unicode normalization"]
            LOAD["<b style='font-size: 20px; color: red;'>Load</b><br/>(Data Staging)<br/>• Batch processing<br/>• Error handling<br/>• Data versioning"]
        end

        subgraph "<b style='font-size: 25px; color: purple;'>Embedding Pipeline</b>"
            CHUNK["<b style='font-size: 20px; color: red;'>Text Chunker</b><br/>(Segmentation)<br/>• 512-1024 tokens<br/>• 20% overlap<br/>• Semantic boundaries"]
            TOKENIZE["<b style='font-size: 20px; color: red;'>Tokenizer</b><br/>(Text Encoding)<br/>• BERT/RoBERTa<br/>• Special tokens<br/>• Max length: 512"]
            EMBED_MODEL["<b style='font-size: 20px; color: red;'>Embedding Model</b><br/>(Vector Generation)<br/>• text-embedding-ada-002<br/>• 1536 dimensions<br/>• Cosine similarity"]
            EMBED_STORE["<b style='font-size: 20px; color: red;'>Embedding Store</b><br/>(Vector Cache)<br/>• HNSW indexing<br/>• Redis cache<br/>• Metadata linking"]
        end
    end

    %% Storage & Persistence
    subgraph "<b style='font-size: 25px; color: green;'>Vector Storage</b>"
        ENCRYPT["<b style='font-size: 20px; color: red;'>AES-256 Encryption</b><br/>(At-Rest Security)"]
        VDB["<b style='font-size: 20px; color: red;'>Vector Database</b><br/>(FAISS/Chroma)"]
        GRAPH["<b style='font-size: 20px; color: red;'>Knowledge Graph</b><br/>(Neo4j/NetworkX)"]
    end

    %% AI Processing Core
    subgraph "<b style='font-size: 25px; color: green;'>AI Engine</b>"
        LIMITER["<b style='font-size: 20px; color: red;'>Rate Limiter</b><br/>(Abuse Prevention)"]
        PROMPT["<b style='font-size: 20px; color: red;'>Prompt Engineering</b><br/>(Query Optimization)"]
        LLM["<b style='font-size: 20px; color: red;'>LLM Integration</b><br/>(GPT/Claude/Llama)"]
        MEMORY["<b style='font-size: 20px; color: red;'>Context Memory</b><br/>(Session Tracking)"]
    end

    %% Retrieval & Generation
    subgraph "<b style='font-size: 25px; color: green;'>RAG Pipeline</b>"
        subgraph "<b style='font-size: 20px; color: orange;'>Retrieval Phase</b>"
            SEMANTIC["<b style='font-size: 18px; color: red;'>Semantic Search</b><br/>(Keyword + Vector)<br/>• Dense retrieval<br/>• Cosine similarity<br/>• Threshold: 0.7"]
            HYBRID["<b style='font-size: 18px; color: red;'>Hybrid Search</b><br/>(BM25 + Dense)<br/>• BM25 k1=1.5<br/>• Reciprocal rank fusion<br/>• Weight ratio: 0.3"]
            SCORE["<b style='font-size: 18px; color: red;'>Semantic Score</b><br/>(Relevance Ranking)<br/>• Cosine similarity<br/>• L2 normalization<br/>• Score range: 0-1"]
            RETRIEVER["<b style='font-size: 18px; color: red;'>Document Retriever</b><br/>(Top-K Selection)<br/>• K=5 documents<br/>• Diversity sampling<br/>• Source filtering"]
        end

        subgraph "<b style='font-size: 20px; color: orange;'>Augmentation Phase</b>"
            FUSION["<b style='font-size: 18px; color: red;'>Document Fusion</b><br/>(Multi-Source Merge)<br/>• Reciprocal rank<br/>• Duplicate removal<br/>• Length weighting"]
            RERANK["<b style='font-size: 18px; color: red;'>Reranking Engine</b><br/>(Cross-Encoder)<br/>• MS MARCO model<br/>• Binary classification<br/>• Top-3 selection"]
            CONTEXT["<b style='font-size: 18px; color: red;'>Context Engineering</b><br/>(Prompt Optimization)<br/>• Max 4096 tokens<br/>• Prompt templates<br/>• Context compression"]
        end

        subgraph "<b style='font-size: 20px; color: orange;'>Generation Phase</b>"
            RAG["<b style='font-size: 18px; color: red;'>RAG Engine</b><br/>(Retrieval + Generation)<br/>• Chain-of-thought<br/>• Source attribution<br/>• Confidence scoring"]
            GENERATE["<b style='font-size: 18px; color: red;'>Response Generator</b><br/>(Answer Synthesis)<br/>• GPT-4/3.5-turbo<br/>• Temperature: 0.1<br/>• Max tokens: 1024"]
        end
    end

    %% Output Processing
    subgraph "<b style='font-size: 25px; color: green;'>Output Processing</b>"
        MULTIMODAL_OUT["<b style='font-size: 20px; color: red;'>Multimodal Output</b><br/>(Response Formatting)<br/>• Text/Image/Audio<br/>• DALL-E for images<br/>• TTS for speech<br/>• Structured formats"]
    end

    %% Quality & Security
    subgraph "<b style='font-size: 25px; color: green;'>Content Safety</b>"
        MODERATE["<b style='font-size: 20px; color: red;'>Content Moderator</b><br/>(Toxicity Filter)"]
        FILTER["<b style='font-size: 20px; color: red;'>PII Filter</b><br/>(Data Privacy)"]
        EVALUATE["<b style='font-size: 20px; color: red;'>Quality Scorer</b><br/>(Response Validation)"]
    end

    %% Monitoring & Analytics
    subgraph "<b style='font-size: 25px; color: green;'>Monitoring</b>"
        AUDIT["<b style='font-size: 20px; color: red;'>Security Audit</b><br/>(Event Logging)"]
        METRICS["<b style='font-size: 20px; color: red;'>Performance Metrics</b><br/>(Usage Analytics)"]
        ALERTS["<b style='font-size: 20px; color: red;'>System Monitoring</b><br/>(Health Checks)"]
    end

    %% Application Controller
    CONTROLLER["<b style='font-size: 20px; color: red;'>Application Controller</b><br/>(Pipeline Orchestration)"]

    %% Flow Connections - User Journey
    USER --> UI
    UI --> QUERY
    QUERY --> AUTH
    AUTH --> FW

    FW --> TEXT_DATA
    FW --> MULTIMODAL
    FW --> APIS
    FW --> DBS
    FW --> WEB

    TEXT_DATA --> LANG_DETECT
    MULTIMODAL --> MODALITY_PROC
    APIS --> LANG_DETECT
    DBS --> LANG_DETECT
    WEB --> LANG_DETECT

    LANG_DETECT --> TRANSLATE
    MODALITY_PROC --> UNIMODAL_CONV
    TRANSLATE --> MALWARE
    UNIMODAL_CONV --> MALWARE

    MALWARE --> EXTRACT
    GATEWAY --> EXTRACT
    VALIDATE --> EXTRACT

    EXTRACT --> TRANSFORM --> LOAD --> CHUNK --> TOKENIZE --> EMBED_MODEL --> EMBED_STORE --> ENCRYPT --> VDB
    EMBED_MODEL --> GRAPH

    EMBED_STORE --> SEMANTIC
    EMBED_STORE --> HYBRID
    SEMANTIC --> SCORE
    HYBRID --> SCORE
    SCORE --> RETRIEVER
    RETRIEVER --> FUSION
    FUSION --> RERANK
    RERANK --> CONTEXT
    CONTEXT --> RAG
    RAG --> GENERATE
    GENERATE --> MODERATE
    MODERATE --> FILTER
    FILTER --> EVALUATE
    EVALUATE --> MULTIMODAL_OUT
    MULTIMODAL_OUT --> RESULTS
    AUDIT --> METRICS
    METRICS --> ALERTS

    ALERTS --> CONTROLLER
    CONTROLLER --> LIMITER
    LIMITER --> PROMPT
    PROMPT --> LLM
    LLM --> MEMORY
    MEMORY --> RESULTS
```

---

## How to Use This Template:

1. **Copy the entire prompt above**
2. **Paste it into any AI assistant** (ChatGPT, Claude, etc.)
3. **The AI will generate the complete styled Mermaid diagram**
4. **Copy the generated diagram into your Markdown file**
5. **Save this template file for future use**

## Collapsible Documentation Sections

For enhanced user experience, consider making workflow sections collapsible in your documentation:

### **Recommended Collapsible Sections:**
- **Architecture Diagram**: `<details><summary>Complete User Journey: From Query to AI-Generated Results</summary>...</details>`
- **Project Structure**: `<details><summary>📁 Complete Project Directory Structure</summary>...</details>`
- **Architecture Components**: `<details><summary>🔍 Click to Expand Component Details</summary>...</details>`
- **ETL Pipeline Workflow**: `<details><summary>🔍 Click to Expand ETL Pipeline Details</summary>...</details>`
- **RAG Pipeline Workflow**: `<details><summary>🔍 Click to Expand RAG Pipeline Details</summary>...</details>`
- **Multimodal Output Workflow**: `<details><summary>🔍 Click to Expand Multimodal Output Details</summary>...</details>`

### **Benefits:**
- **Progressive Disclosure**: Show high-level overview first, details on demand
- **Better Readability**: Less overwhelming for new users
- **Organized Content**: Related information grouped together
- **Performance**: Faster page loading with collapsed sections

## Color Scheme Reference:
- **Main Title**: Dark blue, 2.5em, bold
- **Section Headers**: Green, 25px, bold
- **Pipeline Headers**: Purple, 25px, bold  
- **Component Names**: Red, 20px, bold
- **Descriptions**: Default styling

## Last Updated: February 23, 2026 (Updated Project Structure Heading Style)</content>
<parameter name="filePath">/home/mksaraf/projects/ogm.github.insy/OGM_InSy_Architecture_Diagram_Template.md